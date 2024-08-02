.PHONY: update clean

update:
	home-manager switch --flake .#mwyerman

clean:
	nix-collect-garbage -d
