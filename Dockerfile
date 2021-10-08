FROM anymodconrst001dg.azurecr.io/planetexpress/squashfs-tools:latest
ENV releaseName=ubuntu-base-21.04-base-amd64.tar.gz
# This docker image build requires connectivity to the ubuntu download page. We are selecting a amd64 ubuntu image which is minimized.
# Extract the .tar.gz, create a squashfs file from it and then tar it to be able to import it with Docker. 
# This is quite a lot of conversion here, but we can cache it in the docker build for most purposes.
RUN curl -sO https://cdimage.ubuntu.com/ubuntu-base/releases/hirsute/release/$releaseName && \
tar -xf $releaseName -C /var/live/ && \
rm -f /var/live/*.tar.gz && \
mksquashfs /var/live filesystem.squashfs && \
ls -al /var/live && \
sqfs2tar filesystem.squashfs > tarball && \
rm -f filesystem.squashfs
