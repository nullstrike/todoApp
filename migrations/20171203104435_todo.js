
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTable('todo', (table) => {
      table.increments();
      table.string('title',100).notNullable();
      table.text('description');
      table.integer('priority').notNullable();
      table.boolean('isActive').defaultTo(false).notNullable();
      table.datetime('createdAt').notNullable();
    })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('todo')
  ]);
};
