
exports.seed = function(knex, Promise) {
  return Promise.all([
    knex('todo').del()
      .then(function () {
        const todos = [
          {
            title: 'Learning Javascript',
            priority: 1,
            createdAt: new Date()
          },
          {
            title: 'Learning Java',
            priority: 2,
            createdAt: new Date()
          },
          {
            title: 'Learning C#',
            priority: 4,
            createdAt: new Date()
          },
          {
            title: 'Learning Rails',
            priority: 3,
            createdAt: new Date()
          },
          {
            title: 'Learning PHP',
            priority: 5,
            createdAt: new Date()
          }
        ];

        return knex('todo').insert(todos);
      })
  ]);
};
