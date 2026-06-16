erl \
-pa ebin \
-pa deps/ranch/ebin \
-pa deps/cowlib/ebin \
-pa deps/cowboy/ebin \
-eval "application:ensure_all_started(cowboy), gms_http_app:start(normal, [])."