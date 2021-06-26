import cfmlInDocker.dao.ColourDao
import cfmlInDocker.models.Colour

component {

    function init() {
        variables.dao = new ColourDao()

        return this
    }

    public function getColourById(id) {
        record = variables.dao.selectColourById(id)
        if (record.recordCount) {
            return new Colour(record.id, record.en, record.mi)
        }
        throw(type="ColourNotFoundException", message="Colour not found", detail="Data for Colour with ID #id# not found")
    }
}
