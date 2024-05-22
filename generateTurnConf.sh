#!/usr/bin/env bash

# Function to set a variable if it hasn't already been set
handle_unset_variable () {
  local variable_name=$1;
  local default=$2;
  #  echo $variable_name;
  if [[ -z "$(printenv "$variable_name")" ]]; then
    eval "export $variable_name='$default'";
  fi
}

# All possible TURN env variables that have default values
variables_with_defaults=("TURN_MAIN_LISTENING_PORT" "TURN_MIN_PORT" "TURN_MAX_PORT" "TURN_USER");
variable_defaults=("3478" "49152" "65535" "virtuser:turnvirtoa456");

# Set the undefined env variables in {variables_with_defaults} to their default values
for index in ${!variables_with_defaults[@]}; do
  variable_name=${variables_with_defaults[$index]};
  default=${variable_defaults[$index]};
  handle_unset_variable $variable_name $default;

done

# Deal with variables whose defaults are other variables
#  TURN_REALM=TURN_SERVER_NAME
handle_unset_variable TURN_REALM $TURN_SERVER_NAME;

# Generate conf file from template
envsubst < turnserver.t.conf > generated-turnserver.conf;