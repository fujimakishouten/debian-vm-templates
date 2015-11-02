#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



SEARCH_DATE=`date --date yesterday +"%Y.%m.%d"`
REPLACE_DATE=`date +"%Y.%m.%d"`
SEARCH_VERSION=`date --date yesterday +"9.0.0.%Y%m%d"`
REPLACE_VERSION=`date +"9.0.0.%Y%m%d"`

/bin/sed --in-place --expression "s/$SEARCH_DATE/$REPLACE_DATE/" fujimakishouten-debian-9-testing-virtualbox.json
/bin/sed --in-place --expression "s/$SEARCH_VERSION/$REPLACE_VERSION/" fujimakishouten-debian-9-testing-virtualbox.json

/usr/bin/perl tools/updateTestingIsoFujimakishouten.pl

/usr/bin/git add .
/usr/bin/git commit -m "Daily build $REPLACE_DATE"
/usr/bin/git push origin master



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:
