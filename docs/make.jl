cd(@__DIR__)
using DrWatson
using UnPack

# Convert workflow
import Literate

Literate.markdown(joinpath(@__DIR__, "src", "workflow.jl"), joinpath(@__DIR__, "src"); credit=false)


pages = [
    "简介" => "index_zh.md",
    "工作流简介" => "workflow.md",
    "项目设置" => "project_zh.md",
    "命名你的模拟" => "name_zh.md",
    "保存工具" => "save_zh.md",
    "运行和列表" => "run&list_zh.md",
    "现实例子" => "real_world_zh.md"
]

import Downloads
Downloads.download(
    "https://raw.githubusercontent.com/JuliaDynamics/doctheme/master/build_docs_with_style.jl",
    joinpath(@__DIR__, "build_docs_with_style.jl")
)
include("build_docs_with_style.jl")

build_docs_with_style(pages, DrWatson, UnPack;
    expandfirst=["index_zh.md"], warnonly=true,
)
