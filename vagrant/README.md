# Kubernetes Development Environment

This project provides a local Kubernetes development environment using Vagrant and VirtualBox. It sets up a cluster with one master node and two worker nodes, configured with Ansible for automated provisioning.

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Python 3](https://www.python.org/) and pip
- [Ansible](https://www.ansible.com/)

## Cluster Configuration

The environment consists of:

- 1 Kubernetes master node
  - IP: 192.168.56.201
  - Memory: 2GB
  - CPUs: 2

- 2 Kubernetes worker nodes
  - worker1: 192.168.56.202
  - worker2: 192.168.56.203
  - Each worker has:
    - Memory: 2GB
    - CPUs: 2

All nodes run Ubuntu 22.04 (Jammy Jellyfish) as the base operating system.

## Directory Structure

```
.
├── Vagrantfile           # Vagrant configuration file
├── ansible/             # Ansible automation files
│   ├── ansible.cfg      # Ansible configuration
│   ├── inventory.yml    # Inventory file for cluster nodes
│   ├── Makefile        # Automation tasks
│   └── inventory-helper.sh # Helper script for inventory management
└── k8s_support/         # Kubernetes support files
```

## Getting Started

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd vagrant
   ```

2. Start the cluster:
   ```bash
   vagrant up
   ```

3. The provisioning process will:
   - Create three VMs using VirtualBox
   - Configure network settings
   - Install Python and basic dependencies
   - Set up the Kubernetes cluster using Ansible

4. To access the cluster:
   ```bash
   # SSH into master node
   vagrant ssh master

   # SSH into worker nodes
   vagrant ssh worker1
   vagrant ssh worker2
   ```

## Managing the Cluster

- Start the cluster: `vagrant up`
- Stop the cluster: `vagrant halt`
- Destroy the cluster: `vagrant destroy`
- Reprovision: `vagrant provision`

## Ansible Automation

The project uses Ansible for automated configuration. Key files:

- `ansible.cfg`: Contains Ansible configuration settings
- `inventory.yml`: Defines the cluster nodes and their roles
- `Makefile`: Contains automation tasks for cluster management
- `inventory-helper.sh`: Helps manage the inventory dynamically

## Notes

- The cluster uses a private network in the 192.168.56.x range
- Each node is provisioned with Python 3 and pip for Ansible compatibility
- VirtualBox is used as the provider for VM management

## Troubleshooting

If you encounter any issues:

1. Ensure VirtualBox and Vagrant are properly installed
2. Check that the IP addresses don't conflict with your local network
3. Verify that virtualization is enabled in your BIOS
4. Make sure you have enough system resources available

## Contributing

Feel free to submit issues and enhancement requests!

## License
vanhieuhp <vanhieuit10@gmail.com>