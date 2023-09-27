const cds = require('@sap/cds')
module.exports = class DevChallengeService extends cds.ApplicationService {

    init() {
        return super.init()
    }

    async generateTestQuestions(TestsIn, keys, questionsCount, req) {
        const { Tests, QuestionMaintenance } = this.entities()
        let message = ``
        if (!questionsCount || questionsCount < 1){
           // message = `You asked for zero questions. Nothing to do.`
            throw new cds.error(`You asked for zero questions. Nothing to do.`)
          //  return message
        }

        const Items = await cds.run(
            SELECT.from(QuestionMaintenance).where({test_ID: null}).limit(questionsCount))

        if(!Items || Items.length === 0){
            message =  `No Questions remaining that can be assigned to a test. Please create more`
            return message
        }

        for await (const item of Items){
            item.test_ID = keys.ID
            await cds.run(UPDATE.entity(QuestionMaintenance).data(item).where({ID: item.ID}))
        }
        await cds.run(UPDATE.entity(Tests).set({modifiedAt: new Date()}).where({ID: keys.ID}))

        if (questionsCount > Items.length){
            message = `Only ${Items.length} questions available, but you requested ${questionsCount}`
        }else {
            message = `${questionsCount} questions successfully added to the test!`
        }
        return message
    }



}