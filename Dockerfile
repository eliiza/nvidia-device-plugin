# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM debian:stretch-slim
# ^ Cannot be Alpine since it does not support systemctl
# ^ Systemctl is used to control systemd resources of the host

RUN apt-get update && \
  apt-get install -y -q --no-install-recommends systemd && \
  apt-get -y clean && \
  apt-get -y autoremove

COPY run.sh /run.sh
COPY files/* /nvidia-device-plugin/

CMD [ "/bin/bash", "/run.sh" ]
