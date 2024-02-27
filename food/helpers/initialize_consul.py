import consul as consulate
import socket

from consul import Check
from decouple import config

class Command(BaseCommand):
    """
    Initialize Consul
    """

    def handle(self, **options):
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        address = s.getsockname()[0]
        s.close()
        consul_host = config("CONSUL_HOST")
        consul_port = config("CONSUL_PORT")
        consul_scheme = config("CONSUL_SCHEME")
        consul = consulate.Consul(
            consul_host,
            consul_port,
            consul_scheme,
        )
        health_check = config("HEALTH_CHECK")
        health_check_timeout = config("HEALTH_CHECK_TIMEOUT")
        health_check_deregister = config("HEALTH_CHECK_DEREGISTER")
        host_name = socket.gethostname()
        # Add a service to the local agent
        consul.agent.service.register(
            "Gateway",
            service_id=f"SRV_GATEWAY_{host_name}",
            port=8787,
            address=address,
            tags=["master"],
            check=Check.http(
                health_check, health_check_timeout, deregister=health_check_deregister
            ),
        )
        self.stdout.write(self.style.SUCCESS("Successfully Registered Consul"))
