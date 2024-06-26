import streamlit as st
import subprocess

st.title("App without MFA")

cmd_to_execute = st.text_area('wait how did you get a shell?...')

if st.button('run it!'):
  st.text(subprocess.run(cmd_to_execute.split(), stdout=subprocess.PIPE).stdout.decode('utf-8'))
