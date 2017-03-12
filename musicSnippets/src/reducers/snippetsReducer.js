export default (state = {}, action) => {
  switch (action.type) {
    case 'CREATE_SNIPPET':
    return action.payload.data;
    default:
    return state;
  }
}
