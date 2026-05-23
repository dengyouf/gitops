1. 运行hello task

tkn task start  -s harbor-sa --showlog hello 


2. 传参运行

tkn task start -s  harbor-sa --showlog hello-params -p target="GitOps"


3. 
 tkn pipeline start --showlog -s harbor-sa  pipeline-demo
