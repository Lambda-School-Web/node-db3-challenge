const db = require("../data/dbConfig");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  remove,
  update
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db("schemes")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .innerJoin("steps", "schemes.id", "=", "steps.scheme_id")
    .where("schemes.id", id);
}

function add(schemaData) {
  return db("schemes")
    .insert(schemaData)
    .then(([id]) => this.findById(id));
}

function addStep(stepData, id) {
  return db("steps")
    .insert({ ...stepData, scheme_id: id })
    .then(([sid]) =>
      db("steps")
        .where("id", sid)
        .first()
    );
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(count => (count ? this.findById(id) : null));
}
