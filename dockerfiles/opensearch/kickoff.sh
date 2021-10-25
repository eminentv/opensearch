#!/bin/bash
bash /usr/share/opensearch/plugins/opensearch-security/tools/securityadmin.sh -cd /usr/share/opensearch/plugins/opensearch-security/securityconfig -icl -nhnv -cacert /usr/share/opensearch/config/root-ca.pem -cert /usr/share/opensearch/config/admin.pem -key /usr/share/opensearch/config/admin-key.pem
