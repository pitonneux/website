#!/bin/bash

# Binds to more than just localhost so that it can 
# be accessed from other devices in LAN
rails server -b 0.0.0.0
