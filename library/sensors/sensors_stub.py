# This file will use randomly generated data instead of real hardware sensors
# For all platforms (Linux, Windows, macOS)

import random
from typing import Tuple

import library.sensors.sensors as sensors


class Cpu(sensors.Cpu):
    @staticmethod
    def percentage(interval: float) -> float:
        return random.uniform(0, 100)

    @staticmethod
    def frequency() -> float:
        return random.uniform(800, 3400)

    @staticmethod
    def load() -> Tuple[float, float, float]:  # 1 / 5 / 15min avg:
        return random.uniform(0, 100), random.uniform(0, 100), random.uniform(0, 100)

    @staticmethod
    def is_temperature_available() -> bool:
        return True

    @staticmethod
    def temperature() -> float:
        return random.uniform(30, 90)


class Gpu(sensors.Gpu):
    @staticmethod
    def stats() -> Tuple[float, float, float, float]:  # load (%) / used mem (%) / used mem (Mb) / temp (°C)
        return random.uniform(0, 100), random.uniform(0, 100), random.uniform(300, 16000), random.uniform(30, 90)

    @staticmethod
    def is_available() -> bool:
        return True


class Memory(sensors.Memory):
    @staticmethod
    def swap_percent() -> float:
        return random.uniform(0, 100)

    @staticmethod
    def virtual_percent() -> float:
        return random.uniform(0, 100)

    @staticmethod
    def virtual_used() -> int:  # In bytes
        return random.randint(300000000, 16000000000)

    @staticmethod
    def virtual_free() -> int:  # In bytes
        return random.randint(300000000, 16000000000)


class Disk(sensors.Disk):
    @staticmethod
    def disk_usage_percent() -> float:
        return random.uniform(0, 100)

    @staticmethod
    def disk_used() -> int:  # In bytes
        return random.randint(1000000000, 2000000000000)

    @staticmethod
    def disk_free() -> int:  # In bytes
        return random.randint(1000000000, 2000000000000)


class Net(sensors.Net):
    @staticmethod
    def stats(if_name, interval) -> Tuple[
        int, int, int, int]:  # up rate (B/s), uploaded (B), dl rate (B/s), downloaded (B)
        return random.randint(1000000, 999000000), random.randint(1000000, 999000000), random.randint(
            1000000, 999000000), random.randint(1000000, 999000000)