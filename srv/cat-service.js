const cds = require('@sap/cds')
module.exports = class DevChallengeService extends cds.ApplicationService {

    init() {

        return super.init()
    }

    async generateTestQuestions(TestsIn, keys, questionsCount) {
        const { Tests, Questions } = this.entities()
        let message = ``
        if (!questionsCount || questionsCount < 1){
            message = `You asked for zero questions. Nothing to do.`
            return {"message": message}
        }

        const expr = cds.parse.expr(`test_ID is null`)
        const Items = await cds.run(
            SELECT.from(Questions).where(expr).limit(questionsCount))

        if(!Items || Items.length === 0){
            message =  `No Questions remaining that can be assigned to a test. Please create more`
            return {"message": message}
        }


        Items.forEach(item => {
            item.test_ID = keys.ID
            const expr = cds.parse.expr(`ID = '${item.ID}'`)
            cds.run(UPDATE.entity(Questions).data(item).where(expr))
        })
        const expr2 = cds.parse.expr(`ID = '${keys.ID}'`)
        const TestOutput = await cds.run(            
            SELECT.from(Tests).where(expr2)
        )
        if (questionsCount > Items.length){
            message = `Only ${Items.length} questions available, but you requested ${questionsCount}`
        }else {
            message = `${questionsCount} questions successfully added to the test!`
        }
        return { "message": message,
          "randomQuestions": Items, "testQuestions": TestOutput }
    }



}