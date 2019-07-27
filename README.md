## About the repo

Could not open a connection to your authentication agent.
Fix: setting up SSH_AUTH_SOCK environment variable.


	ssh-agent bash # initialize agent
	SSH_AUTH_SOCK=/tmp/ssh-agVZL13989/agent.13989;
	export SSH_AUTH_SOCK;
	SSH_AGENT_PID=13990; export SSH_AGENT_PID;
  
  echo Agent pid 13990;

------------------------

gcloud compute instance

	--service-account=1234567890-compute@developer.gserviceaccount.com \\ attach service account as an identity to the instance
	--scopes=https://www.googleapis.com/auth/cloud-platform              \\ cloud-platform scope to the instance

------------------------

This repository is used as a part of [infrastructure-as-code-tutorial](https://github.com/Artemmkin/infrastructure-as-code-tutorial).
