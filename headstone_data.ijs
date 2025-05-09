require 'tables/csv'

clean =: (<;._1 ' [^\d.] ') rxrplc ]

wollondata =: fixcsv fread 'wollon86.csv'
sydneydata =: fixcsv fread 'sydney86.csv'

wollon_year =: }. ". ([: clean 0 pick ])"1 wollondata
sydney_year =: }. ". ([: clean 0 pick ])"1 sydneydata

echo wollon_year

exit 3
