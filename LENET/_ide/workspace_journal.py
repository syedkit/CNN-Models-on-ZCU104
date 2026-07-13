# 2026-03-20T20:41:18.617258900
import vitis

client = vitis.create_client()
client.set_workspace(path="lenet")

comp = client.create_hls_component(name = "lenet",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="lenet")
comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

