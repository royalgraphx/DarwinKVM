#!/bin/bash

# This script is used by Carnations for all Ruby/Jekyll based repositories. You can use it for any other similarly configured project.

clear

current_path="$PWD"
repo_name="DarwinKVM"
ROOT_PATH=""
DOCS_ROOT=""

if [[ "$current_path" == *"$repo_name"* ]]; then
  path_after_repo_name="${current_path#*${repo_name}}"
  len_after=${#path_after_repo_name}
  len_current=${#current_path}
  len_root_path=$((len_current - len_after))
  ROOT_PATH="${current_path:0:${len_root_path}}"
  DOCS_ROOT="${current_path}/docs"
  echo "Current Path: ${current_path}"
  echo "Derived ROOT_PATH: ${ROOT_PATH}"
  echo "Derived DOCS_ROOT: ${DOCS_ROOT}"
else
  echo "Error: '$repo_name' not found in path: ${current_path}"
  exit 1
fi

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Error: This script is for macOS only. Found: $(uname -s)"
  exit 1
fi

echo "macOS detected. Proceeding..."
echo ""

GEMS_PATH="/usr/local/lib/ruby/gems/"
echo "Checking for: ${GEMS_PATH}"

if [[ ! -d "$GEMS_PATH" ]]; then
  echo "Error: Missing Ruby gems directory: ${GEMS_PATH}"
  exit 1
fi

echo ""
echo "Available Ruby versions:"
version_dirs=()

for item_path in "$GEMS_PATH"*/ ; do
  [[ -d "$item_path" ]] && version_dirs+=("$(basename "$item_path")")
done

if [[ ${#version_dirs[@]} -eq 0 ]]; then
  echo "No Ruby versions found in ${GEMS_PATH}."
  exit 1
fi

IFS=$'\n' sorted_versions=($(printf "%s\n" "${version_dirs[@]}" | sort -V))
unset IFS

for version_name in "${sorted_versions[@]}"; do
  echo "$version_name"
done

echo ""

NEWEST_VERSION="${sorted_versions[${#sorted_versions[@]}-1]}"
echo "Latest Ruby version: ${NEWEST_VERSION}"
echo ""

echo "Checking core paths for Ruby ${NEWEST_VERSION}..."

NEWEST_VERSION_BASE_PATH="${GEMS_PATH}${NEWEST_VERSION}"
NEWEST_VERSION_BIN_PATH="${NEWEST_VERSION_BASE_PATH}/bin"
NEWEST_VERSION_GEMS_SUBPATH="${NEWEST_VERSION_BASE_PATH}/gems"
NEWEST_VERSION_DOC_PATH="${NEWEST_VERSION_BASE_PATH}/doc"

paths_ok=true

for path in "$NEWEST_VERSION_BIN_PATH" "$NEWEST_VERSION_GEMS_SUBPATH" "$NEWEST_VERSION_DOC_PATH"; do
  echo -n "Checking ${path}... "
  if [[ -d "$path" ]]; then
    echo "OK"
  else
    echo "Missing"
    paths_ok=false
  fi
done

if ! $paths_ok; then
  echo "Error: One or more core directories missing for Ruby ${NEWEST_VERSION}."
  exit 1
fi

echo "All required directories exist for Ruby ${NEWEST_VERSION}."
echo ""

BUNDLER_STATE="UNKNOWN"
found_bundlers=("$(find "$NEWEST_VERSION_GEMS_SUBPATH" -type d -name 'bundler-*' 2>/dev/null)")

if [[ -n "$found_bundlers" ]]; then
  echo "Found bundler installation(s):"
  echo "$found_bundlers"
  BUNDLER_STATE="FOUND"
  # Extract version number from bundler path, e.g., "bundler-2.6.9" -> "2.6.9"
  BUNDLER_VERSION_INSTALLED=$(basename "$found_bundlers")
  BUNDLER_VERSION_INSTALLED="${BUNDLER_VERSION_INSTALLED#bundler-}"
else
  echo "No bundler installation found in ${NEWEST_VERSION_GEMS_SUBPATH}."
fi

echo "Bundler state: ${BUNDLER_STATE}"
echo ""

if [[ "$BUNDLER_STATE" == "FOUND" ]]; then
  echo "Route taken: Bundler found."
elif [[ "$BUNDLER_STATE" == "OUTDATED" ]]; then
  echo "Route taken: Bundler found but outdated."
else
  echo "Route taken: No bundler found."
  echo "Running: gem update"
  gem update
  echo "Running: gem install bundler"
  gem install bundler

  found_bundlers_post_install=("$(find "$NEWEST_VERSION_GEMS_SUBPATH" -type d -name 'bundler-*' 2>/dev/null)")
  if [[ -n "$found_bundlers_post_install" ]]; then
    echo "Successfully installed bundler. Found installation(s):"
    echo "$found_bundlers_post_install"
    BUNDLER_VERSION_INSTALLED=$(basename "$found_bundlers_post_install")
    BUNDLER_VERSION_INSTALLED="${BUNDLER_VERSION_INSTALLED#bundler-}"
  else
    echo "Error: Bundler installation failed."
    exit 1
  fi
fi

echo ""

echo "Checking for Gemfile.lock in ${DOCS_ROOT}..."
GEMFILE_LOCK_PATH="${DOCS_ROOT}/Gemfile.lock"

if [[ -f "$GEMFILE_LOCK_PATH" ]]; then
  echo "Found Gemfile.lock at ${GEMFILE_LOCK_PATH}"

  echo "Checking for 'BUNDLED WITH' section in Gemfile.lock..."

  bundled_with_version=$(sed -n '/^BUNDLED WITH$/ {n;p;}' "$GEMFILE_LOCK_PATH" | tr -d '[:space:]')

  if [[ -n "$bundled_with_version" ]]; then
    echo "Bundled with version found: $bundled_with_version"
  else
    echo "'BUNDLED WITH' section not found or version missing in Gemfile.lock."
  fi

  if [[ "$bundled_with_version" != "$BUNDLER_VERSION_INSTALLED" ]]; then
    echo "Bundled version ($bundled_with_version) does not match system version ($BUNDLER_VERSION_INSTALLED). Updating Gemfile.lock..."

    sed -i "" "/^BUNDLED WITH$/ {n;s/.*/  $BUNDLER_VERSION_INSTALLED/;}" "$GEMFILE_LOCK_PATH"

    echo "Gemfile.lock updated to use Bundled With version: $BUNDLER_VERSION_INSTALLED"
  else
    echo "Bundled with version matches the system Ruby version. No update needed."
  fi
else
  echo "Gemfile.lock not found in ${DOCS_ROOT}"
  exit 1
fi

exit 0
