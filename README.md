<p align="center">
  <img width="40%" height="40%" src="./Assets/DarwinKVMLogo.png">
</p>

<p align="center">
  <img width="80%" height="80%" src="./Assets/HeaderTextOnly.png">
</p>

<h3 align="center">An Advanced Guide for running macOS within QEMU/KVM</h3>
<h5 align="center">EFI guides, GPU Passthrough guides, Display Overrides for incompatible monitors, Custom Memory Mapping, Custom USB Mapping, Fake Core Count for incompatible CPU Topology, Host CPU Overclocking, Host Network Bridge for VM visibility, AMD GPU Zero-RPM Disable and custom sPPT Fan Curve, as well as many more advanced tutorials ready to further perfect your macOS experience!</h5>

<h3 align="center">This is the git repo, follow the guide <a href="https://docs.darwinkvm.com/">here!</a></h2>
<h5 align="center">PATIENCE! This is NOT a Pre-Built EFI! You are responsible for creating it!</h5>

</br>

<p align="center">
  <img width="650" height="200" src="./Assets/HeaderGallery.png">
</p>

<h3 align="center">macOS Sonoma 14.4 Beta</h3>
<p align="center">
  <img src="./showcase/HacProKVM144Beta.png">
</p>

<h3 align="center">macOS Sonoma 14.3</h3>
<p align="center">
  <img src="./showcase/HacProKVM143.png">
</p>

<h3 align="center">macOS Sonoma 14.2.1 (Credits: @heliokroger)</h3>
<p align="center">
  <img src="./showcase/Helio1421.png">
</p>

<h3 align="center">macOS Sonoma 14.1</h3>
<p align="center">
  <img src="./showcase/HacProKVM141.png">
</p>

<h3 align="center">macOS Sonoma 14.1 (Credits: @Haxi0)</h3>
<p align="center">
  <img src="./showcase/haxi0DKVM.png">
</p>

<h3 align="center">macOS Sonoma 14.0</h3>
<p align="center">
  <img src="./showcase/HacProKVM140.png">
</p>

<h3 align="center">macOS Ventura 13.5.1</h3>
<p align="center">
  <img src="./showcase/HacProKVM1351.png">
</p>

<h3 align="center">macOS Ventura 13.5 + NVIDIA GPU (Credits: @Zormeister)</h3>
<p align="center">
  <img src="./showcase/ZormDKVMnvidia.png">
</p>

<h3 align="center">macOS Ventura 13.5 (Credits: @Rowlul)</h3>
<p align="center">
  <img src="./showcase/kaggsterDKVM135.png">
</p>

<h3 align="center">macOS Ventura 13.4</h3>
<p align="center">
  <img src="./showcase/HacProKVM134.png">
</p>

</br>

<h1 align="center">Need Help?</h1>
</br>
<p align="center">
  <img width="50%" height="50%" src="./Assets/discord-logo-white.png">
</p>
<h4 align="center">If you run into any issues, you can join the <a href="https://discord.gg/ryQFC8Vk7b">DarwinKVM</a> Discord server! Feel free to ping the <span style="color: #d48dff;">@Helpers</span> role within a help channel for support. <a href="https://github.com/royalgraphx/Hexley">Hexley</a> provides our discord users with a multitude of commands to assist anyone who may need specific actions performed. Such features that Hexley offers aim to speed up the process with command such as:</h4>

<h6 align="center">/genplatinfo - Generates PlatformInfo for a given Mac model</h6>
<h6 align="center">/pci - Find PCI devices by vendor ID and device ID.</h6>
<h6 align="center">/usb - Find USB devices by vendor ID and device ID.</h6>
<h6 align="center">/encodehex - Converts device ID to little-endian hex value.</h6>
<h6 align="center">/decodehex - Decodes little-endian hex values into 0x0000 Format.</h6>
<h6 align="center">/decodebase64 - Decodes Base64 to text.</h6>
<h6 align="center">/link - Quickly link a URL for someone.</h6>
<h6 align="center">/time - Displays the time of a given user.</h6>

</br>

<h1 align="center">Contributing to the Documentation</h1>

<h4 align="center">If you have any changes or improvements you'd like to contribute for review and merge, to update misinformation or outdated information, as well as maybe even adding whole new pages, you can follow the general outline below to get a local copy of the documentation running.</h4>
<h6 align="center">Instructions written for macOS hosts but is adoptable to other OS's.</h6>

</br>

1. Install/Update ``brew`` 
   - Visit https://brew.sh/ for instructions and information.

2. Install/Update ``ruby``
   - Once ``brew`` is installed, you can run ``brew install ruby`` in your terminal.
   - If using ZSH (any recent versions of macOS) Be sure to read the post install text as it suggest you should run the following command to export to PATH:
      - ``echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc``
      - Restart Terminal for changes to apply.

3. Install/Update ``gem`` and ``bundler``
   - Run ``gem update`` in your terminal window.
   - Run ``gem install bundler`` in your terminal window.

4. Fork DarwinKVM, git clone your fork, navigate to Docs directory.
   - ``git clone --recursive git@github.com:yourusername/DarwinKVM.git``
   - ``cd DarwinKVM/docs``

5. Installing Docs dependencies, and running the server.
   - Run ``bundle install`` in your terminal window.
   - Running ``bundle exec jekyll serve`` will build and run a live copy of the DarwinKVM docs on port 4000 by default.
   - To change the port, you can specify the IP address and port to run on, allowing local mobile devices to also connect and preview DKVM Docs.
      - ``bundle exec jekyll serve --host YOUR_IP_ADDRESS --port PORT``

<h4 align="center">You'll now be able to see the changes you make update live so you can work quickly and preview the final look of your Markdown files easily. Once you are done making your changes you can then proceed to submit a Pull Request for review, and eventual merge to Main.</h4>
<h6 align="center">A big thanks to all contributors and future contributors! ꩓</h6>
