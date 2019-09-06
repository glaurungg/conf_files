- [x] socialweb-chef QA changes
- [x] snapshots are being taken and deleted
- [x] socialweb-chef cron, stage and production changes
- [x] deploy socialweb changes. currently blocked by sumo when applying chef,
  need to go in to each failing node and remove (/move) /opt/SumoCollector and
  then re-run chef. Woof
- [x] promote ssh key to master (ask russ to take a peek)
- [x] move care mysql read replicas from r5.2s to r4.2s (b/c of RIs)
- [x] tweetriver (+ others) redis monitoring
- [x] cassandra weekend p2 post mortem
- [x] failover mysql masters to r4s
- [x] hyperkube logs to ES via fluentd. Just need to fix k8s api audit
- [x] containerized dandy builds -- dockerception (part of squirrel jenkins)
- [x] remove limit from fluentd-elasticsearch daemonset to fix kibana
  - Is ther e away to stop it from silently getting oomkilled? I guess it's
    killing a daemon subprocess so not actually killing the pod so not much
    sigh.
- [x] book kubecon tickets + flights by SEP 10th!!
- [x] Fix the damn massrel-solr3 recipe
  - That poise shit is super broken, and I can't figure out where the hell the
    purne_shards.py script (which is what's failing to install because of the
    pip bug) is getting run from. If I could figure out where it gets run from I
    could figure out how safe just throwing all the junk out the window is so we
    can just run that script without the poise stuff (and hey maybe even update
    to a relevant version of pip)
  - ended up just yanking poise-python all together since it's dead.
- [x] Fix fluentd logging to parse `log` field as json
- [ ] squirrel write up + admin
  - Admin:
    - [ ] Update squirrel dandy build -- finish fixing it
    - [x] Have Jesse Hodges guinea pig the setup & verify deploy sections (check
      thurs)
  - Doc:
    - [ ] Update to address Jhodges concerns & demo feedback
      - ECS - How does it compare? Cost?
      - ConfigR - How does it compare?
      - SSM - How does it compare?
      - per mando: "as far as ECS goes, if you want to dig into all the stuff
        skillet has to do with ELBs, connection draining, etc that might give
        you a good idea of all the things we have to do vs things that k8s gives
        us out of the box"
    - [x] Sign up for demo slot & slides by FRI 9/6
- [ ] Look into SSHD best practices (for user unification)
- [ ] See if we can't squeeze more value out of the k8s api audit logs
  - fluentd - pulling more fields out of responseJSON so they're filterable
  - k8s - tuning so maybe they're not so voluminous & general setting tweaking
  - audit log consumption ideas. Cluster backup, test cluster replication
- [ ] 9/12 -- go refresh kibana fields and remove the template max docvalue
  setting
