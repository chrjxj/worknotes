# Virtual box


### Command line 

#### Reference

https://devminz.github.io/posts/devops/virtualbox-cli-vm-bridged-networking/




# Start VM in headless mode
VBoxManage startvm MyVM --type headless

# List virtual machines
VBoxManage list vms
"MyVM" {e4b0c92c-4301-4a7d-8af8-fe02fed00451}

# Power off VM
VBoxManage controlvm MyVM poweroff

VBoxManage modifyvm ubuntu-serv --nic1 bridged --nictype1 82545EM --bridgeadapter1 vmbr1
VBoxManage showvminfo ubuntu-serv -details -machinereadable  

VBoxManage modifyvm ubuntu-serv --nic1 bridged --nictype1 82545EM --bridgeadapter1 vmbr1

