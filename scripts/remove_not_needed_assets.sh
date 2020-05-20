#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
MATOMO_ROOT="$SCRIPTPATH/../app/";

# we need to remove jquery as it is shipped with wordpress and we use their jquery
rm -rf $MATOMO_ROOT/libs/bower_components/jquery
rm -rf $MATOMO_ROOT/libs/bower_components/jquery-ui
rm -rf $MATOMO_ROOT/config/environment/test.php
rm -rf $MATOMO_ROOT/config/environment/ui-test.php
rm -rf $MATOMO_ROOT/vendor/twig/twig/ext
rm -rf $MATOMO_ROOT/vendor/tecnickcom/tcpdf/tools
rm -rf $MATOMO_ROOT/plugins/Provider
rm -rf $MATOMO_ROOT/vendor/doctrine/cache/lib/Doctrine/Common/Cache/RiakCache.php
rm -rf $MATOMO_ROOT/plugins/GeoIp2/Commands/ConvertRegionCodesToIso.php # cause it creates DB connection too early

# lets remove some extra libs that aren't needed
find $MATOMO_ROOT/libs/bower_components -name '*.js' -exec rm -rf {} +
find $MATOMO_ROOT/libs/bower_components -name '*.map' -exec rm -rf {} +
find $MATOMO_ROOT/libs/jqplot -name '*.js' -exec rm -rf {} +
find $MATOMO_ROOT/plugins/*/angularjs -name '*.js' -exec rm -rf {} +
find $MATOMO_ROOT/plugins/*/javascripts -name '*.js' ! -name 'Piwik_Overlay.js' ! -name 'optOut.js' ! -name 'previewmode.js' ! -name 'previewmodedetection.js' ! -name 'tagmanager.js' ! -name 'tagmanager.min.js' -exec rm -rf {} +

# delete some empty directories like config, angularjs, javascripts, lang, ...
find $MATOMO_ROOT/plugins/ -d  -empty -delete

echo -e "Done!... "
