> **INSTALLATION OF nginx**

**Step :1**

-   Update the package

-   Command : sudo apt update

**Step :2**

-   Install nginx

-   Command : sudo apt install nginx

**Step :3**

-   Enable the nginx service

-   Command : sudo systemctl enable nginx

**Step :4**

-   Start the nginx service

-   Command : sudo systemctl start nginx

**Step :4**

-   Observe the nginx process

-   Command : ps aux \| grep nginx

-   It check the running process

**Step :5**

-   Check the port used by nginx

-   Find out which port nginx is listenting on

-   Command : sudo lsof -i -P -n \| grep LISTEN \| grep nginx

**Step :6**

-   Get the status of the nginx service

-   Command : sudo systemctl status nginx

**Step :7**

-   Stop the nginx service

-   Command : sudo systemctl stop nginx

**Step :8**

-   Start the nginx service again

-   Command : sudo systemctl start nginx

**Step :9**

-   Kill the nginx process

-   To manually kill ngnix process first find out the process ID (PID)

-   ps aux \| grep nginx

-   pidof nginx

-   sudo kill -TERM \<PID\>

SCREENSHOT

![](vertopal_e9b40965ec2b49c8b9c4de8fd80099c6/media/image1.png){width="6.268055555555556in"
height="3.2222222222222223in"}

![](vertopal_e9b40965ec2b49c8b9c4de8fd80099c6/media/image2.png){width="5.916666666666667in"
height="3.3125in"}

![](vertopal_e9b40965ec2b49c8b9c4de8fd80099c6/media/image3.png){width="6.268055555555556in"
height="3.324324146981627in"}

![](vertopal_e9b40965ec2b49c8b9c4de8fd80099c6/media/image4.png){width="6.216216097987751in"
height="3.0944444444444446in"}

![](vertopal_e9b40965ec2b49c8b9c4de8fd80099c6/media/image5.png){width="3.915948162729659in"
height="2.8816754155730533in"}

![](vertopal_e9b40965ec2b49c8b9c4de8fd80099c6/media/image6.png){width="6.268055555555556in"
height="3.5243055555555554in"}
