const config = require('../../config/config');

// const acesso = require('bb-common/access/acesso');

module.exports = app => {
  const controller = app.controllers.empresa;

  // app.route(`${config.apiUrl}/v1/deslocamento/listar/proprias/vigentes`)
  //   // .get( controller.consultarIndicador);
  //   .get(acesso.validarAcesso(3, { token: config.accessToken }), controller.consultarIndicador);

  app.route(`${ config.apiUrl }/v1/empresa/cadastrar`)
      .post(controller.cadastrarEmpresa);

  app.route(`${ config.apiUrl }/v1/empresa/consultar`)
      .get(controller.consultarEmpresas);
};
