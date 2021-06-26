import cfmlInDocker.miscellaneous.GroupByViaCfml

component extends=testbox.system.BaseSpec {

    function run() {
        describe("Testing group-by via CFML modern version", () => {
            it("groups the rows by year and month correctly", () => {
                ungroupedRecords = getUngroupedRecords()
                expectedGroupedRecords = getGroupedRecords()

                groupByViaCfml = new GroupByViaCfml()
                groupedRecords = groupByViaCfml.groupByYearAndMonth(ungroupedRecords)
                expect(groupedRecords).toBe(expectedGroupedRecords)
            })
        })
    }

    private query function getUngroupedRecords() {
        wddx = fileRead("#getThisDirectory()#/ungroupedRecords.wddx")
        wddx action="wddx2cfml" input=wddx output="query";
        return query
    }

    private query function getGroupedRecords() {
        wddx = fileRead("#getThisDirectory()#/groupedRecords.wddx")
        wddx action="wddx2cfml" input=wddx output="query";
        return query
    }

    private string function getThisDirectory() {
        return getDirectoryFromPath(getCurrentTemplatePath())
    }
}
