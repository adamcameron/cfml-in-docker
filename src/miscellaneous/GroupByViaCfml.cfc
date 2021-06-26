<cfcomponent output="false">

    <cfscript>
        public query function groupByYearAndMonth(required query ungroupedRecords) {
            return ungroupedRecords.reduce((grouped={}, row) => {
                y = row.settlementDate.year()
                m = row.settlementDate.month()
                key = "#y#-#m#"
                grouped[key] = grouped[key] ?: {stgl = 0, ltgl = 0}
                grouped[key].stgl = grouped[key].stgl + row.ShortTermGainLoss
                grouped[key].ltgl = grouped[key].ltgl + row.LongTermGainLoss

                return grouped
            }).reduce(
                (records, key, values) => {
                    records.addRow({
                        month = key.listLast("-"),
                        year = key.listFirst("-"),
                        ltgl = values.ltgl,
                        stgl = values.stgl
                    })
                    return records
                },
                queryNew("MONTH,YEAR,LTGL,STGL", "Integer,Integer,Double,Double")
            ).sort((r1, r2) => {
                yearDiff = r1.year - r2.year
                if (yearDiff != 0) {
                    return yearDiff
                }
                return r1.month - r2.month
            })
        }
    </cfscript>
</cfcomponent>