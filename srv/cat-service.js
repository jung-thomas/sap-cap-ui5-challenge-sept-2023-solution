const cds = require('@sap/cds')
module.exports = class DevChallengeService extends cds.ApplicationService {

    init() {

        return super.init()
    }

    async generateTestQuestions(TestsIn, id, questionsCount) {
        const { Tests, Questions } = this.entities()
        const expr = cds.parse.expr(`test_ID is null`)
        const Items = await cds.run(
            SELECT.from(Questions).where(expr).limit(questionsCount))
      
        Items.forEach(item => {
            item.test_ID = id
            const expr = cds.parse.expr(`ID = '${item.ID}'`)
            cds.run(UPDATE.entity(Questions).data(item).where(expr))
        })
        const expr2 = cds.parse.expr(`ID = '${id}'`)
        const TestOutput = await cds.run(            
            SELECT.from(Tests).where(expr2)
        )
        return { "message": `${questionsCount} questions successfully added to the test!`,
          "randomQuestions": Items, "testQuestions": TestOutput }
    }



}