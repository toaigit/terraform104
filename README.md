Create an EC2 instance with the following characteristics:  
       Apache  
       Shibboleth  
       ASG,LC, ELB   
       Local (private) DNS push, NO Elastic IP  
       SNS Notification when instance is terminated or started.   
       All apache and shibb configuration is configured using   
       curl to retrieve the file and script to execute.   
       main.tf file is tiny due to all the userdata is placed in the runcmd   
       stored on another server.   
