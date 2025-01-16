all:
	$(MAKE) -C sim pre-sim
	$(MAKE) -C syn all
	$(MAKE) -C sim post-sim

clean:
	$(MAKE) -C syn clean
	$(MAKE) -C sim clean
