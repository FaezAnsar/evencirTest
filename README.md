Key Highlights

Used DioCacheInterceptor to cache api calls

Implemented pagination through central logic of  abstract classes

Category api didn't provide thumbnail so the url was hit and first product fetched by limit=1 and thumbnail added to category model ,the calls were cached and category cards kept alive using KeepAliveWrapper

ProductListPages caters both raw products and category wise products through an optional categoryUrl ,powered by singular cubit



