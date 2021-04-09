{ stdenv, lib, rustPlatform, fetchFromGitHub, openssl, pkg-config }:
let version = "0.1.5"; in
rustPlatform.buildRustPackage {
  pname = "pista";
  inherit version;
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];
  doCheck = false;
  src = fetchFromGitHub {
    owner = "NerdyPepper";
    repo = "pista";
    rev = "v${version}";
    sha256 = "1nrqgl5r5ja95g5xhfvkvfz72g318pqc7yj4fwl6xnad19smvms0";
  };
  cargoSha256 = "1qjg4z4nfqmiawczs4p4rf4mq250aqb5brd3hd2jcjdhqajksr90";

  meta = with lib; {
    description = "Simple {bash, zsh} prompt for programmers";
    homepage = "https://github.com/NerdyPepper/pista";
    license = licenses.mit;
    maintainers = with maintainers; [ nerdypepper ];
  };
}
