component {

    function init(MyDao dao) {
        variables.dao = dao
    }

    function getObjectsFromStorage(orderby="id") {
        orderBy = validateOrderBy(orderBy)
        return dao.getRecords(orderBy).reduce((array=[], record) => array.append(new Number(record.mi)))
    }

    private function validateOrderBy(orderBy) {
        return orderBy.reFind("^(?:id|mi|en)$") ? orderby : "id"
    }
}
