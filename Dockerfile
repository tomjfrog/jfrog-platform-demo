FROM releases-docker.jfrog.io/jfrog/pipelines-u18node:16

RUN "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install google-cloud-sdk google-cloud-sdk-gke-gcloud-auth-plugin
RUN apt-get update && apt-get --only-upgrade install kubectl google-cloud-sdk-app-engine-grpc google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-go google-cloud-sdk-anthos-auth google-cloud-sdk-nomos google-cloud-sdk-cloud-run-proxy google-cloud-sdk-firestore-emulator google-cloud-sdk-gke-gcloud-auth-plugin google-cloud-sdk-cloud-build-local google-cloud-sdk-minikube google-cloud-sdk-kpt google-cloud-sdk-bigtable-emulator google-cloud-sdk-datastore-emulator