#! /bin/bash
# Create addresses migration and scaffold 

cd ~/Projects/test-wares
rails g scaffold address \
addr_type:string \
addr_key:string \
name:string \
street:text \
city:string \
state:string \
postal:string \
contact:text \
email:text \
phone:text 
rake db:migrate

