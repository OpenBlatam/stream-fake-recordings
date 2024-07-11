/* core_kernel.c */

/* Core Kernel Components */
#include "memory_management.h"
#include "process_management.h"
#include "hardware_interaction.h"

/* Distributed Components */
#include "distributed_file_system.h"
#include "distributed_networking.h"
#include "distributed_device_drivers.h"

/* Communication Mechanisms */
#include "message_passing.h"
#include "rpc.h"

/* Hybrid Management */
#include "hybrid_management.h"

int main() {
    /* Initialize Core Kernel Components */
    init_memory_management();
    init_process_management();
    init_hardware_interaction();

    /* Initialize Distributed Components */
    init_distributed_file_system();
    init_distributed_networking();
    init_distributed_device_drivers();

    /* Initialize Communication Mechanisms */
    init_message_passing();
    init_rpc();

    /* Initialize Hybrid Management */
    init_hybrid_management();

    /* Start Kernel */
    start_kernel();

    return 0;
}
