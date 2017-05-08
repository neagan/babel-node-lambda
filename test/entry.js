import mod from './test-mod';

exports.redrive = async(event, context, callback) => {
  mod.run();
  console.log(event);
}
