unit uController;
// implementa a controller, que aplica as regras de negocio e se comunica dom a DAO

interface
  uses uDao, DB, sysutils, DBAccess, MyAccess, MemDS, uControllerMarca,
  uControllerEstado, uControllerFornecedor, uControllerCliente, uControllerCidade,
  uControllerPais, uControllerProduto, uControllerForma, uControllerUsuario,
  uControllerGrupo, uControllerFuncionario, uControllerCondicao, uControllerParcela;

  type controller = class

  private

  protected
    umDao : Dao;
    umControllerMarca : controllerMarca;
    umControllerFornecedor : controllerFornecedor;
    umControllerCliente : controllerCliente;
    umControllerCidade : controllerCidade;
    umControllerEstado : controllerEstado;
    umControllerPais : controllerPais;
    umControllerProduto : controllerProduto;
    umControllerForma : controllerForma;
    umControllerUsuario : ControllerUsuario;
    umControllerGrupo : controllerGrupo;
    umControllerFuncionario : controllerFuncionario;
    umControllerCondicao : controllerCondicao;
    umControllerParcela: controllerParcela;

  public
    constructor CrieObj;
    destructor destrua_se;

    procedure setControllerParcela (pControllerParcela: controllerParcela);
    function getControllerParcela : controllerParcela;

    procedure setControllerCondicao (pControllerCondicao: controllerCondicao);
    function getControllerCondicao : controllerCondicao;

    procedure setControllerFuncionario (pControllerFuncionario: controllerFuncionario);
    function getControllerFuncionario : controllerFuncionario;

    procedure setControllerGrupo (pControllerGrupo: controllerGrupo);
    function getControllerGrupo : controllerGrupo;

    procedure setControllerUsuario (pControllerUsuario: controllerUsuario);
    function getControllerUsuario : controllerUsuario;

    procedure setControllerForma (pControllerForma: controllerForma);
    function getControllerForma : controllerForma;

    procedure setControllerProduto (pControllerProduto: controllerProduto);
    function getControllerProduto : controllerProduto;

    procedure setControllerMarca (pControllerMarca: controllerMarca);
    function getControllerMarca : controllerMarca;

    procedure setControllerFornecedor (pControllerFornecedor : controllerFornecedor);
    function getControllerFornecedor : controllerFornecedor;

    procedure setControllerCliente (pControllerCliente : controllerCliente);
    function getControllerCliente : controllerCliente;

    procedure setControllerCidade (pControllerCidade : controllerCidade);
    function getControllerCidade : controllerCidade;

    procedure setControllerEstado (pControllerEstado : controllerEstado);
    function getControllerEstado : controllerEstado;

    procedure setControllerPais (pControllerPais : controllerPais);
    function getControllerPais : controllerPais;
end;

implementation

{ controller }

// ------------- CONSTRUCTOR E DESTRUCTOR ------------
constructor controller.CrieObj;
begin
  umDao := dao.CrieObjeto;
  umControllerMarca := controllerMarca.CrieObj;
  umControllerFornecedor := controllerFornecedor.CrieObj;
  umControllerCliente := controllerCliente.CrieObj;
  umControllerCidade := controllerCidade.CrieObj;
  umControllerEstado := controllerEstado.CrieObj;
  umControllerPais := controllerPais.CrieObj;
  umControllerProduto := controllerProduto.CrieObj;
  umControllerForma := controllerForma.CrieObj;
  umControllerUsuario := controllerUsuario.CrieObj;
  umControllerGrupo := controllerGrupo.CrieObj;
  umControllerFuncionario := controllerFuncionario.CrieObj;
  umControllerCondicao := controllerCondicao.CrieObj;
  umControllerParcela := controllerParcela.CrieObj;
end;

destructor controller.destrua_se;
begin
  umDao.destrua_se;
  umControllerMarca.destrua_se;
  umControllerFornecedor.destrua_se;
  umControllerCliente.destrua_se;
  umControllerCidade.destrua_se;
  umControllerEstado.destrua_se;
  umControllerPais.destrua_se;
  umControllerProduto.destrua_se;
  umControllerForma.destrua_se;
  umControllerUsuario.destrua_se;
  umControllerGrupo.destrua_se;
  umControllerFuncionario.destrua_se;
  umControllerCondicao.destrua_se;
  umControllerParcela.destrua_se;
end;

// --------------- setters and getters -> PRODUTO ------------------
function controller.getControllerProduto: controllerProduto;
begin
   Result := self.umControllerProduto;
end;

procedure controller.setControllerProduto(
  pControllerProduto: controllerProduto);
begin
   self.umControllerProduto := pControllerProduto;
end;

// ------------------- setters and getters -> MARCA ------------------
function controller.getControllerMarca: controllerMarca;
begin
    Result := self.umControllerMarca;
end;

procedure controller.setControllerMarca(pControllerMarca: controllerMarca);
begin
    self.umControllerMarca := pControllerMarca;
end;


// --------------- setters and getters -> FORNECEDOR ------------------
function controller.getControllerFornecedor: controllerFornecedor;
begin
    Result := self.umControllerFornecedor;
end;

procedure controller.setControllerFornecedor(
  pControllerFornecedor: controllerFornecedor);
begin
  self.umControllerFornecedor := pControllerFornecedor;
end;

// --------------- setters and getters -> CLIENTE ------------------
function controller.getControllerCliente: controllerCliente;
begin
    Result := Self.umControllerCliente;
end;

procedure controller.setControllerCliente(
  pControllerCliente: controllerCliente);
begin
    self.umControllerCliente := pControllerCliente;
end;


// --------------- setters and getters -> CIDADE ------------------
function controller.getControllerCidade: controllerCidade;
begin
  Result := self.umControllerCidade;
end;

procedure controller.setControllerCidade(
  pControllerCidade: controllerCidade);
begin
   self.umControllerCidade := pControllerCidade;
end;

// --------------- setters and getters -> ESTADO ------------------
function controller.getControllerEstado: controllerEstado;
begin
   Result := self.umControllerEstado;
end;

procedure controller.setControllerEstado(
  pControllerEstado: controllerEstado);
begin
  self.umControllerEstado := pControllerEstado;
end;

// --------------- setters and getters -> PA�S ------------------
function controller.getControllerPais: controllerPais;
begin
   Result := self.umControllerPais;
end;

procedure controller.setControllerPais(pControllerPais: controllerPais);
begin
  self.umControllerPais := pControllerPais;
end;

// ------------ setters and getters -> FORMA DE PGTO ------------------
function controller.getControllerForma: controllerForma;
begin
   Result := self.umControllerForma;
end;

procedure controller.setControllerForma(pControllerForma: controllerForma);
begin
   self.umControllerForma := pControllerForma;
end;


// ------------ setters and getters -> USU�RIO ------------------
function controller.getControllerUsuario: controllerUsuario;
begin
   Result := self.umControllerUsuario;
end;

procedure controller.setControllerUsuario(
  pControllerUsuario: controllerUsuario);
begin
   self.umControllerUsuario := pControllerUsuario;
end;

// ------------ setters and getters -> GRUPOS ------------------
function controller.getControllerGrupo: controllerGrupo;
begin
    Result := self.umControllerGrupo;
end;

procedure controller.setControllerGrupo(pControllerGrupo: controllerGrupo);
begin
   self.umControllerGrupo := pControllerGrupo;
end;

// ------------ setters and getters -> FUNCION�RIOS ------------------
function controller.getControllerFuncionario: controllerFuncionario;
begin
  Result := self.umControllerFuncionario;
end;

procedure controller.setControllerFuncionario(
  pControllerFuncionario: controllerFuncionario);
begin
  self.umControllerFuncionario := pControllerFuncionario;
end;

// ------------ setters and getters -> CONDI��O PGTO ------------------
function controller.getControllerCondicao: controllerCondicao;
begin
   Result := self.umControllerCondicao;
end;

procedure controller.setControllerCondicao(
  pControllerCondicao: controllerCondicao);
begin
   self.umControllerCondicao := pControllerCondicao;
end;

// ------------ setters and getters -> PARCELA ------------------
function controller.getControllerParcela: controllerParcela;
begin
    Result := self.umControllerParcela;
end;

procedure controller.setControllerParcela(
  pControllerParcela: controllerParcela);
begin
   self.umControllerParcela := pControllerParcela;
end;

end.
//----------- FIM DA CLASSE ---------------------------- FIM DA CLASSE --------

