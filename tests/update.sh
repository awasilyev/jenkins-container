#!/bin/bash

sed --in-place=.out  "s/JENKINS\_PLUGINS: ''/JENKINS\_PLUGINS: 'greenballs'/" ansible/container.yml
