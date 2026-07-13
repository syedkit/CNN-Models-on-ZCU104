# 2026-03-30T21:21:33.550298400
import vitis

client = vitis.create_client()
client.set_workspace(path="MobileNetV2")

comp = client.create_hls_component(name = "hls_component",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="hls_component")
comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

vitis.dispose()

