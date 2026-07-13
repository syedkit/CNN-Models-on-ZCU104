# 2026-03-30T23:16:36.561023100
import vitis

client = vitis.create_client()
client.set_workspace(path="alexnet")

comp = client.get_component(name="hls_component")
comp.run(operation="PACKAGE")

vitis.dispose()

