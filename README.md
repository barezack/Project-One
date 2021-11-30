
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

The diagram is located in the diagram folder of this project (project-one/diagrams/elk_stack.gliffy)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Yml file may be used to install only certain pieces of it, such as Filebeat.

Filebeat.yml, metricbeat.yml, install_elk.yml, pentest.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
 - Beats in Use
 - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting strain to the network.

What aspect of security do load balancers protect? What is the advantage of a jump box?_
 
The load balancer as availability to the security of the network by spreading network traffic across multiple servers. The advantage to having a single jump-box to access your network, is that it’s a single point of access to the network to protect.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the usage and system logs.

What does Filebeat watch for?
Filebeat watches for changes in the system logs.

What does Metricbeat record?_
Metricbeat watches for usage data

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.
|   Name    |  Function  | IP Address  |    Operating System      |
|-----------|------------|-------------|--------------------------|
| Jump-box  |  Gateway   |  10.0.0.4   | Linux Server 18.04 LTS   |
|  Web 1    |   DVWA     |  10.0.0.9   | Linux Server 18.04 LTS   |
|  Web 2    |   DVWA     |  10.0.0.8   | Linux Server 18.04 LTS   |
|  Web 3    |   DVWA     |  10.0.0.5   | Linux Server 18.04 LTS   |
|  Elk 1    | Elk Stack  |  10.1.0.4   | Linux Server 18.04 LTS   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk 1 and Web server machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Add whitelisted IP addresses
10.0.0.4

Machines within the network can only be accessed by jump-box.
Which machine did you allow to access your ELK VM? What was its IP address?_
My laptop is the only machine that can access the ELK machine outside the network within the network the jump-box ansible container can access it.


A summary of the access policies in place can be found in the table below.

|   Server  | Publicly Accessible |  Allowed IP Addresses and Ports|
|-----------|---------------------|--------------------------------|
| Jump-box  |  No                 |   Localhost Port 22                                     |
|  Web 1    |  Yes                |   Localhost Port 80,   10.0.0.4 Port 22  |
|  Web 2    |  Yes                |   Localhost Port 80,  10.0.0.4 Port 22    |
|  Web 3    |  Yes                |   Localhost Port 80,  10.0.0.4 Port 22   |
|  Elk 1    |  Yes                |   Localhost Port 5601, 10.0.0.4 Port 22   |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

What is the main advantage of automating configuration with Ansible?_

The advantage is the ability to repeat the process with little errors.

The playbook implements the following tasks:

    • The first step was to install docker.io via apt
    • The second step was to install python3-pip via apt
    • The third step was to make docker use pip3 as default
    • The fourth step was to increase virtual memory I used sysctl for this
    • The fifth step was to tell the module that is has to use more memory so with sysctl
    • The sixth step was to install the ELK Docker container image.


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/barezack/Project-One/blob/main/Ansible/Screenshots/docker_ps_output.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
List the IP addresses of the machines you are monitoring_
The Machine that being monitored by the ELK Stack have the following Ips:
web 2:10.0.0.8, Web 1:10.0.0.9, Web 3:10.0.0.5
 
We have installed the following Beats on these machines:
Specify which Beats you successfully installed_
FileBeats and MetricBeats

These Beats allow us to collect the following information from each machine:
In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

Metricbeat allows us to collect Cpu usage, memory usage, and network load
Filebeat allow use to view system logging information, example attempted ssh connections with the wrong ssh key.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the .YML file to your ansible folder /etc/ansible/.
- Update the hosts file to include the given name of the servers you want to run the playbook on and their IPs.
- Run the playbook, and navigate to server to check that the installation worked as expected.

_Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_

install_elk.yml is the ELK Stack playbook. You would copy it to your “/etc/ansible/files” folder.

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

To install a playbook on a machine you must decided on a host name for the group of machines your want it to run on then you would change your hosts file in etc/ansible/ folder to reflect the name you picked and the IPs of those machines. To install different playbooks on different machines you would just give them a different host name and list their IPs under that host name.


Which URL do you navigate to in order to check that the ELK server is running?

The URL I would use to test an internet connect to the ELK server would be http://20.119.191.141:5601/app/kibana. But if I was inside the server I would run “curl localhost:5601/app/kibana”

 a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

