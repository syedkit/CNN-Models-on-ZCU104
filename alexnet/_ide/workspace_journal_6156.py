# 2026-03-30T23:10:07.585361100
import vitis

client = vitis.create_client()
client.set_workspace(path="alexnet")

vitis.dispose()

