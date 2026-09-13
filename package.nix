{
  fetchPnpmDeps,
  nodejs,
  pnpm_11,
  pnpmConfigHook,
  stdenv,
}:
let
  pnpm = pnpm_11;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "ldbugged-net";
  version = "2026-09-14";

  src = ./.;

  nativeBuildInputs = [
    nodejs
    pnpmConfigHook
    pnpm
  ];

  pnpmDeps = fetchPnpmDeps {
    inherit (finalAttrs) pname version src;
    inherit pnpm;
    fetcherVersion = 4;
    hash = "sha256-f/62w/Oce6Pwgi4F0HLEWaw/oQU5Svrnzu1bV+zFr0g=";
  };

  buildPhase = ''
    pnpm run build
  '';

  installPhase = ''
    mkdir -p $out
    cp -r build $out/
  '';
})