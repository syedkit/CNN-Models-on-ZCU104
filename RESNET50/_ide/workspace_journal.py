# 2026-03-30T20:06:48.398213100
import vitis

client = vitis.create_client()
client.set_workspace(path="ResNet50")

comp = client.create_hls_component(name = "hls_component",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="hls_component")
comp.run(operation="SYNTHESIS")

vitis.dispose()

