#!/bin/bash

# Compiling bundle properties with metadata
/usr/local/glassfish4/glassfish/bin/asadmin create-jvm-options "\-Ddataverse.lang.directory=/opt/dv"
/bin/cp -f /opt/dv/metadataFragment.xhtml /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/metadataFragment.xhtml
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/se-SE > /opt/dv/Bundle_se.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/sl-SI > /opt/dv/Bundle_sl.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/de-AT > /opt/dv/Bundle_de.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/fr-FR > /opt/dv/Bundle_fr.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/it-IT > /opt/dv/Bundle_it.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/hu-HU > /opt/dv/Bundle_hu.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/Bundle_zh.properties > /opt/dv/Bundle_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/astrophysics_zh.properties > /opt/dv/astrophysics_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/biomedical_zh.properties > /opt/dv/biomedical_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/BuiltInRoles_zh.properties > /opt/dv/BuiltInRoles_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/citation_zh.properties > /opt/dv/citation_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/geospatial_zh.properties > /opt/dv/geospatial_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/journal_zh.properties > /opt/dv/journal_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/MimeTypeDisplay_zh.properties > /opt/dv/MimeTypeDisplay_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/MimeTypeFacets_zh.properties > /opt/dv/MimeTypeFacets_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/socialscience_zh.properties > /opt/dv/socialscience_zh.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/zh-CN/ValidationMessages_zh.properties > /opt/dv/ValidationMessages_zh.properties

if [ -n "$CV_MANAGER_URL" ]; then
    # English
    #echo ""  >> /opt/dv/Bundle.properties
    #echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle.properties
    #echo 'lang=en' >> /opt/dv/Bundle.properties

    # Swedish
    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_se.properties
    echo 'lang=se' >> /opt/dv/Bundle_se.properties

    # Slovenian
    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_sl.properties
    echo 'lang=sl' >> /opt/dv/Bundle_sl.properties

    # German
    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_de.properties
    echo 'lang=de' >> /opt/dv/Bundle_de.properties

    # French
    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_fr.properties
    echo 'lang=fr' >> /opt/dv/Bundle_fr.properties

    # Italian
    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_it.properties
    echo 'lang=it' >> /opt/dv/Bundle_it.properties

    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_hu.properties
    echo 'lang=hu' >> /opt/dv/Bundle_hu.properties

    # Chinese
    echo "cvmanagerURL=$CV_MANAGER_URL" >> /opt/dv/Bundle_zh.properties
    echo 'lang=zh' >> /opt/dv/Bundle_zh.properties

    cp -fr /opt/dv/cvmanager/templates/* /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/
fi

# curl http://localhost:8080/api/admin/settings/:Languages -X PUT -d '[{ "locale":"en", "title":"English"}, {"locale":"sl-SI", "title": "Slovenian"},  {"locale":"de-AT", "title": "German"},  {"locale":"fr-FR", "title":"French"}, {"locale":"it-IT", "title":"Italian"}, {"locale":"hu-HU", "title":"Hungarian"}, {  "locale":"se-SE", "title":"Swedish" }, {  "locale":"zh-CN", "title":"Chinese" }]'
curl http://localhost:8080/api/admin/settings/:Languages -X PUT -d '[{ "locale":"en", "title":"English"}, { "locale":"zh-CN", "title":"Chinese" }]'