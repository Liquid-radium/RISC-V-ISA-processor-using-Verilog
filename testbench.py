import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.clock import Clock


@cocotb.test()
async def test_single_cycle(dut):
    """Basic test for single_cycle_top."""

    # Create and start a 10ns clock on clk
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

    # Apply reset
    dut.rst.value = 1
    await Timer(20, units="ns")
    dut.rst.value = 0
    await RisingEdge(dut.clk)
    
    # Print some internal signal values (update names if needed)
    for i in range(10):
        await RisingEdge(dut.clk)
        cocotb.log.info(f"[{i}] PC: {dut.pc_top.value} | Instr: {dut.rd_instr.value}")

    # Example assertion (update condition for your use case)
    assert dut.pc_top.value.integer == 4 * 10, "PC didn't advance correctly!"
