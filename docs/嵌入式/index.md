# 嵌入式

我对嵌入式开发的了解不多，只简单接触过，并且更侧重软件而非硬件

## MCU

MCU 开发通常是用 C 写源代码，然后编译成 MCU 能够执行的指令并烧录进硬件中

有实际硬件和无实际硬件时开发流程会略有不同

```mermaid
flowchart TD
    A[代码] --生成--> B[hex 文件]
    B --烧录--> C[实际芯片]
    C --连接--> D[实际输出设备]
    D --显示--> E[实际结果]

    B --加载--> F[模拟芯片]
    F --连接--> G[模拟输出设备]
    G --显示--> H[模拟结果]
```

由于我没有实际硬件，且不喜欢非开源的东西，所以稍微研究了一下环境搭建的方式。

我目前使用的方案是 VSCode + PlatformIO IDE + SimulIDE

- VSCode 写代码
- PlatformIO IDE 生成 hex 文件
- SimulIDE 绘制电路图，将模拟芯片和模拟输出设备连接，加载 hex 文件并运行，可视化地查看结果

### MCS-51

由于 [vscode-cpptools issues#2499](https://github.com/Microsoft/vscode-cpptools/issues/2499)，目前 VSCode 官方的 C/C++ 插件并不支持 SDCC 拓展的一些类型。

可以手动修改 `.vscode\c_cpp_properties.json` 让编辑器识别这种拓展类型。

```json
{
    "configurations": [
        {
            "defines": [
                // others
                "__sfr=unsigned char",
                "__sbit=int",
                "__at(a)= ",
                ""
            ],
        }
    ]
}
```

还有的时候 C/C++ 插件甚至直接无法解析 `compilerPath` 字段，直接连编译器的头文件都找不到。我遇到过这个 BUG，并且至今没找到优雅的解决方法。

这些问题的真正解决也许只有等待 C/C++ 插件正式支持 SDCC 了。

## FPGA

FPGA 开发分为前端和后端。前端用代码描述模块的设计，最基本的单元是逻辑门，输出门级网表；后端布局布线，将门级网表变成比特流烧录进芯片中

```mermaid
flowchart LR
    subgraph A [前端]
        A1[编写代码] --> A2[功能仿真];
        A2 --> A3[逻辑综合];
    end

    subgraph B [后端]
        B1[布局布线] --> B2[时序分析]
        B2 --> B3[生成比特流];
    end

    A3 --输出门级网表--> B1
```

我只研究过 FPGA 前端的环境搭建。

我目前使用的开源方案是 VSCode + Icarus Verilog + GTKWave + Yosys

- VSCode 写代码
- Icarus Verilog 编译代码，生成波形文件
- GTKWave 查看波形文件
- Yosys 编译代码，生成门级网表
