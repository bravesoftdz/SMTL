unit uUsuario;

interface
uses uPai, uFuncionario;
  type Usuario = class(pai)

  private

  protected
      nome : string[30];
      login: string[20];
      senha: string[20];
      tipo: Integer;
      umFuncionario : Funcionario;

  public
    constructor crieobj;
    destructor destrua_se;

    procedure setFuncionario (pfuncionario : Funcionario);
    function getFuncionario : Funcionario;

    procedure setNome(pNome : string);
    function getNome  : string;

    procedure setLogin(pLogin : string);
    function getLogin  : string;

    procedure setSenha(pSenha : string);
    function getSenha  : string;

    procedure setTipo(pTipo : Integer);
    function getTipo  : Integer;
end;

implementation

{ Usuario }

constructor Usuario.crieobj;
begin
   self.nome := '';
   self.login := '';
   self.senha := '';
   self.tipo := 0;
   self.umFuncionario := Funcionario.crieobj;
   inherited;
end;

destructor Usuario.destrua_se;
begin
   umFuncionario.destrua_se;
   inherited;
end;

function Usuario.getFuncionario: Funcionario;
begin
    Result := self.umFuncionario;
end;

function Usuario.getLogin: string;
begin
   Result := self.login;
end;

function Usuario.getNome: string;
begin
   Result := self.nome;
end;

function Usuario.getSenha: string;
begin
   Result := Self.senha;
end;

function Usuario.getTipo: Integer;
begin
   Result := self.tipo;
end;

procedure Usuario.setFuncionario(pfuncionario: Funcionario);
begin
  self.umFuncionario := pfuncionario;
end;

procedure Usuario.setLogin(pLogin: string);
begin
    self.login := pLogin;
end;

procedure Usuario.setNome(pNome: string);
begin
   self.nome := pNome;
end;

procedure Usuario.setSenha(pSenha: string);
begin
   self.senha := pSenha;
end;

procedure Usuario.setTipo(pTipo: Integer);
begin
  self.tipo := pTipo;
end;

end.
